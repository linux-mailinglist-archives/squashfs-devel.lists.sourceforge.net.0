Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 074445274CB
	for <lists+squashfs-devel@lfdr.de>; Sun, 15 May 2022 03:17:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nq2sW-0001I3-Dp; Sun, 15 May 2022 01:16:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1np2Ev-000673-U2
 for squashfs-devel@lists.sourceforge.net; Thu, 12 May 2022 06:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H/TrlpDlY7GcT/PtCd2Qn03YpuFdqv9BFmHUeEezNAs=; b=UPeuvlwAXAZTtL6BplJxOy8ttv
 IxYZoVI4KWNcLRqelPzmEsOWBDD+8342XZCn+qrOxE83TpFyYnXnEgVWb7yGei4Cjl8plcucGVbmd
 OXmkN8CMuKQZBKlHpVIdhVpRWujC96TQhFO9Dh9jZ1QbvZ6Q88imBtRTd5ASNZMCVGWw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H/TrlpDlY7GcT/PtCd2Qn03YpuFdqv9BFmHUeEezNAs=; b=CivBZp78grZF26giEHIM8t+hNb
 Kwes6M9hNXWeKAnkLR2b0W532wiHjeCyWD8nz66bgHxUqD7IFDvpd3gW1rk9B5FzrfSU8xvhBk4zJ
 rHL9Xyrchpt9Udzc/Vy1VEiUsui/kNBY28cYq2gPC2qlxv9FBgxqtJ86X/Uowt4h2mQE=;
Received: from mail-vk1-f177.google.com ([209.85.221.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1np2Es-00010c-Ur
 for squashfs-devel@lists.sourceforge.net; Thu, 12 May 2022 06:23:56 +0000
Received: by mail-vk1-f177.google.com with SMTP id o132so2168102vko.11
 for <squashfs-devel@lists.sourceforge.net>;
 Wed, 11 May 2022 23:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H/TrlpDlY7GcT/PtCd2Qn03YpuFdqv9BFmHUeEezNAs=;
 b=iZaZ+S/P/lSB/srplzcsz2eHG0FloWA8/Od+LbVrWCmJ6mJMEb6TS8sshn9Xi2RtEu
 6OQ1ZPYcYkdZhv9CZePP5xG406wzw1Ijx0uuLQjHwaHcObjOzDFRUmbfUU3D7Yp7bodJ
 gDn8L673r75MUf2NUDmImcaXv24mVep9jNPY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/TrlpDlY7GcT/PtCd2Qn03YpuFdqv9BFmHUeEezNAs=;
 b=bvSb122R+Dx1ufnfsjqp0xeqCcm5PwuVGPyrdnjdo9yXOl8rwCpRrmF6msKHAOGvdc
 N6wdmbLrOFkgSsWpqhpAnOeDyEccm3rf2SjTRQnnyBcDg7QvPGSRj+Uf6Fp+qYyiSiwc
 ImR8PIzJ/OIzZNg+IKsOmTB1rX6TrfKK27A4YwxJbTFOKorUjOXEOTKCrq76JJV/ot5R
 ELPYT8c36UOsJlok077iiEHmEt9lu0UOeuWahK/uR1Xg3v8U4VTfh+TBB0xdoZRTwEt/
 /GpAoocni2bV9/zRwG9k2PbzsDR0IIA2UBtQcrkA/WG9zg04ct98bUEu4OsG86TvFaA+
 Vr4g==
X-Gm-Message-State: AOAM530rz+4TU8Vz6h7NQ4dt0pj5dZeqdCXM/kqq1IbCCctCytNpVTRD
 qQjZCWShccBJxCik3tDn4P2KQl/p61SUoHhe+AN2fg==
X-Google-Smtp-Source: ABdhPJy7DdmGHMVnR63NRDpq7FSFO4XT9fKL8az1/1RTxxbLhxTnvOtAuuuNv2Uq7wmQ9/B5o/hnWzusdl5jkpR/mgQ=
X-Received: by 2002:a05:6122:da8:b0:331:3b30:8b40 with SMTP id
 bc40-20020a0561220da800b003313b308b40mr15919850vkb.30.1652336628101; Wed, 11
 May 2022 23:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
 <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
 <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
 <CAJMQK-h3p72P=Ltpk9X1o6f56iKN6z=DimEtdGEUXf8cVabQOQ@mail.gmail.com>
 <adf436dd-d17d-7a84-68ba-0dd2125620cf@squashfs.org.uk>
In-Reply-To: <adf436dd-d17d-7a84-68ba-0dd2125620cf@squashfs.org.uk>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 12 May 2022 14:23:21 +0800
Message-ID: <CAJMQK-gQ+LD6t74FUwuxYVcmETgJxK8Q5_ZtuJvELm+yr=f8Yg@mail.gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Content-Type: multipart/mixed; boundary="000000000000c4a4db05deca99fc"
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 12,
 2022 at 3:13 AM Phillip Lougher <phillip@squashfs.org.uk>
 wrote: > > On 11/05/2022 16:12, Hsin-Yi Wang wrote: > > On Tue, May 10, 2022
 at 9:19 PM Xiongwei Song <sxwjean@gmail.com> wrot [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1np2Es-00010c-Ur
X-Mailman-Approved-At: Sun, 15 May 2022 01:16:57 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "Song, Xiongwei" <Xiongwei.Song@windriver.com>,
 Zhang Yi <yi.zhang@huawei.com>, Xiongwei Song <sxwjean@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

--000000000000c4a4db05deca99fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2022 at 3:13 AM Phillip Lougher <phillip@squashfs.org.uk> w=
rote:
>
> On 11/05/2022 16:12, Hsin-Yi Wang wrote:
> > On Tue, May 10, 2022 at 9:19 PM Xiongwei Song <sxwjean@gmail.com> wrote=
:
> >>
> >> On Tue, May 10, 2022 at 8:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wro=
te:
> >>>
> >>> On Tue, May 10, 2022 at 8:31 PM Xiongwei Song <sxwjean@gmail.com> wro=
te:
> >>>>
> >>>> Hi Hsin-Yi,
> >>>>
> >>>> On Mon, May 9, 2022 at 10:29 PM Hsin-Yi Wang <hsinyi@chromium.org> w=
rote:
> >>>>>
> >>>>> On Mon, May 9, 2022 at 9:21 PM Matthew Wilcox <willy@infradead.org>=
 wrote:
> >>>>>>
> >>>>>> On Mon, May 09, 2022 at 08:43:45PM +0800, Xiongwei Song wrote:
> >>>>>>> Hi Hsin-Yi and Matthew,
> >>>>>>>
> >>>>>>> With the patch from the attachment on linux 5.10, ran the command=
 as I
> >>>>>>> mentioned earlier,
> >>>>>>> got the results below:
> >>>>>>> 1:40.65 (1m + 40.65s)
> >>>>>>> 1:10.12
> >>>>>>> 1:11.10
> >>>>>>> 1:11.47
> >>>>>>> 1:11.59
> >>>>>>> 1:11.94
> >>>>>>> 1:11.86
> >>>>>>> 1:12.04
> >>>>>>> 1:12.21
> >>>>>>> 1:12.06
> >>>>>>>
> >>>>>>> The performance has improved obviously, but compared to linux 4.1=
8, the
> >>>>>>> performance is not so good.
> >>>>>>>
> >>>>> I think you shouldn't compare the performance with 4.18 directly,
> >>>>> since there might be other factors that impact the performance.
> >>>>
> >>>> Make sense.
> >>>>
> >>>>> I'd suggest comparing the same kernel version with:
> >>>>> a) with this patch
> >>>>> b) with c1f6925e1091 ("mm: put readahead pages in cache earlier") r=
everted.
> >>>>
> >>>> With 9eec1d897139 ("squashfs: provide backing_dev_info in order to d=
isable
> >>>> read-ahead") reverted and applied 0001-WIP-squashfs-implement-readah=
ead.patch,
> >>>> test result on linux 5.18=EF=BC=9A
> >>>> 1:41.51 (1m + 41.51s)
> >>>> 1:08.11
> >>>> 1:10.37
> >>>> 1:11.17
> >>>> 1:11.32
> >>>> 1:11.59
> >>>> 1:12.23
> >>>> 1:12.08
> >>>> 1:12.76
> >>>> 1:12.51
> >>>>
> >>>> performance worse 1 ~ 2s than linux 5.18 vanilla.
> >>>>
> >>>
> >>> Can you share the pack file you used for testing? Thanks
> >>
> >> You are saying the files that are put in squashfs partitions? If yes, =
I can tell
> >> I just put some dynamic libraries in partitions:
> >> -rwxr-xr-x 1 root root  200680 Apr 20 03:57 ld-2.33.so
> >> lrwxrwxrwx 1 root root      10 Apr 20 03:57 ld-linux-x86-64.so.2 -> ld=
-2.33.so
> >> -rwxr-xr-x 1 root root   18776 Apr 20 03:57 libanl-2.33.so
> >> lrwxrwxrwx 1 root root      14 Apr 20 03:57 libanl.so.1 -> libanl-2.33=
.so
> >> lrwxrwxrwx 1 root root      17 Apr 20 04:08 libblkid.so.1 -> libblkid.=
so.1.1.0
> >> -rwxr-xr-x 1 root root  330776 Apr 20 04:08 libblkid.so.1.1.0
> >> -rwxr-xr-x 1 root root 1823192 Apr 20 03:57 libc-2.33.so
> >> ...... snip ......
> >>
> >> The number of files is 110(55 libs + 55 soft links to libs).  I have 9=
0 squashfs
> >> partitions which save the identical files. The space of each partition=
 is 11M,
> >> nothing special.
> >>
> >> Thanks.
> >>
> >
> > I noticed that there's a crash at
> > https://elixir.bootlin.com/linux/latest/source/lib/lzo/lzo1x_decompress=
_safe.c#L218
> > when testing on my system.
> > (I have CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS enabled)
> >
> > Full logs:
> > [  119.062420] Unable to handle kernel paging request at virtual
> > address ffffffc017337000
> > [  119.062437] Mem abort info:
> > [  119.062442]   ESR =3D 0x96000047
> > [  119.062447]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [  119.062451]   SET =3D 0, FnV =3D 0
> > [  119.062454]   EA =3D 0, S1PTW =3D 0
> > [  119.062457] Data abort info:
> > [  119.062460]   ISV =3D 0, ISS =3D 0x00000047
> > [  119.062464]   CM =3D 0, WnR =3D 1
> > [  119.062469] swapper pgtable: 4k pages, 39-bit VAs, pgdp=3D0000000041=
099000
> > [  119.062473] [ffffffc017337000] pgd=3D000000010014a003,
> > p4d=3D000000010014a003, pud=3D000000010014a003, pmd=3D000000010ba59003,
> > pte=3D0000000000000000
> > [  119.062489] Internal error: Oops: 96000047 [#1] PREEMPT SMP
> > [  119.062494] Modules linked in: vhost_vsock vhost vhost_iotlb
> > vmw_vsock_virtio_transport_common vsock rfcomm algif_hash
> > algif_skcipher af_alg veth uinput xt_cgroup mtk_dip mtk_cam_isp
> > mtk_vcodec_enc mtk_vcodec_dec hci_uart mtk_fd mtk_mdp3 v4l2_h264
> > mtk_vcodec_common mtk_vpu xt_MASQUERADE mtk_jpeg cros_ec_rpmsg btqca
> > videobuf2_dma_contig v4l2_fwnode v4l2_mem2mem btrtl elants_i2c mtk_scp
> > mtk_rpmsg rpmsg_core mtk_scp_ipi mt8183_cci_devfreq ip6table_nat fuse
> > 8021q bluetooth ecdh_generic ecc iio_trig_sysfs cros_ec_lid_angle
> > cros_ec_sensors cros_ec_sensors_core industrialio_triggered_buffer
> > kfifo_buf cros_ec_sensorhub cros_ec_typec typec hid_google_hammer
> > ath10k_sdio lzo_rle lzo_compress ath10k_core ath mac80211 zram
> > cfg80211 uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
> > videobuf2_common cdc_ether usbnet r8152 mii joydev
> > [  119.062613] CPU: 4 PID: 4161 Comm: chrome Tainted: G        W
> >    5.10.112 #105 39f11bffda227eaae4c704733b9bf01db22d8b4d
> > [  119.062617] Hardware name: Google burnet board (DT)
> > [  119.062623] pstate: 20400005 (nzCv daif +PAN -UAO -TCO BTYPE=3D--)
> > [  119.062636] pc : lzo1x_decompress_safe+0x1dc/0x564
> > [  119.062643] lr : lzo_uncompress+0x134/0x1f0
> > [  119.062647] sp : ffffffc01837b860
> > [  119.062650] x29: ffffffc01837b860 x28: 0000000000000000
> > [  119.062656] x27: 0000000000005451 x26: ffffffc0171c9445
> > [  119.062662] x25: 0000000000000000 x24: ffffffc017437000
> > [  119.062668] x23: ffffffc0171c944f x22: ffffffc017136000
> > [  119.062673] x21: ffffffc017336ff1 x20: ffffffc017237000
> > [  119.062679] x19: ffffffc01837b8d0 x18: 0000000000000000
> > [  119.062684] x17: 00000000000001eb x16: 0000000000000012
> > [  119.062689] x15: 000000000010000f x14: d600120202000001
> > [  119.062695] x13: ffffffc017336ff1 x12: ffffffc017336ff4
> > [  119.062700] x11: 0000000000000002 x10: 01010101010100ff
> > [  119.062705] x9 : ffffffffffffffff x8 : ffffffc0171c944d
> > [  119.062710] x7 : d15d3aaabd294330 x6 : 0206397115fe28ab
> > [  119.062715] x5 : ffffffc0171c944f x4 : 000000000009344f
> > [  119.062721] x3 : ffffffc01837b8d0 x2 : ffffffc017237000
> > [  119.062726] x1 : 000000000009344f x0 : ffffffc0171c9447
> > [  119.062731] Call trace:
> > [  119.062738]  lzo1x_decompress_safe+0x1dc/0x564
> > [  119.062742]  lzo_uncompress+0x134/0x1f0
> > [  119.062746]  squashfs_decompress+0x6c/0xb4
> > [  119.062753]  squashfs_read_data+0x1a8/0x298
> > [  119.062758]  squashfs_readahead+0x308/0x474
> > [  119.062765]  read_pages+0x74/0x280
> > [  119.062769]  page_cache_ra_unbounded+0x1d0/0x228
> > [  119.062773]  do_page_cache_ra+0x44/0x50
> > [  119.062779]  do_sync_mmap_readahead+0x188/0x1a0
> > [  119.062783]  filemap_fault+0x100/0x350
> > [  119.062789]  __do_fault+0x48/0x10c
> > [  119.062793]  do_cow_fault+0x58/0x12c
> > [  119.062797]  handle_mm_fault+0x544/0x904
> > [  119.062804]  do_page_fault+0x260/0x384
> > [  119.062809]  do_translation_fault+0x44/0x5c
> > [  119.062813]  do_mem_abort+0x48/0xb4
> > [  119.062819]  el0_da+0x28/0x34
> > [  119.062824]  el0_sync_compat_handler+0xb8/0xcc
> > [  119.062829]  el0_sync_compat+0x188/0x1c0
> > [  119.062837] Code: f94001ae f90002ae f94005ae 910041ad (f90006ae)
> > [  119.062842] ---[ end trace 3e9828c7360fd7be ]---
> > [  119.090436] Kernel panic - not syncing: Oops: Fatal exception
> > [  119.090455] SMP: stopping secondary CPUs
> > [  119.090467] Kernel Offset: 0x2729c00000 from 0xffffffc010000000
> > [  119.090471] PHYS_OFFSET: 0xffffffd880000000
> > [  119.090477] CPU features: 0x08240002,2188200c
> >
> > 1) Traces near when the crash happened:
> > [   79.495580] Block @ 0x60eea9c, compressed size 65744, src size 10485=
76
> > [   80.363573] Block @ 0x1f9f000, compressed size 200598, src size 1048=
576
> > [   80.371256] Block @ 0x1fcff96, compressed size 80772, src size 10485=
76
> > [   80.428388] Block @ 0x1fe3b1a, compressed size 83941, src size 10485=
76
> > [   80.435319] Block @ 0x1ff82ff, compressed size 77936, src size 10485=
76
> > [   80.724331] Block @ 0x4501000, compressed size 364069, src size 1048=
576
> > [   80.738683] Block @ 0x4dccf28, compressed size 603215, src size 2097=
152
>
> Src size 2097152 is clearly wrong, as the maximum data block size is 1
> Mbyte or 1048576.
>
> That debug line comes from
>
> https://elixir.bootlin.com/linux/latest/source/fs/squashfs/block.c#L156
>
> ----
> TRACE("Block @ 0x%llx, %scompressed size %d, src size %d\n",
>                 index, compressed ? "" : "un", length, output->length);
> ----
>
> Which indicates your code has created a page_actor of 2 Mbytes in size
> (output->length).
>
> This is completely incorrect, as the page_actor should never be larger
> than the size of the block to be read in question.  In most cases that
> will be msblk->block_size, but it may be less at the end of the file.
>
> You appear to be trying to read the amount of readahead requested.  But,
> you should always be trying to read the lesser of readahead, and the
> size of the block in question.
>
> Hope that helps.
>
> Phillip
>
Hi Phillip,
Thanks for the explanation. After restricting the size feed to
page_actor, the crash no longer happened.

Hi Xiongwei,
Can you test this version (sent as attachment) again? I've tested on
my platform:
- arm64
- kernel 5.10
- pack_data size ~ 300K
- time ureadahead pack_data
1. with c1f6925e1091 ("mm: put readahead pages in cache earlier") reverted:
0.633s
0.755s
0.804s

2. apply the patch:
0.625s
0.656s
0.768s

Hi Matthew,
Thanks for reviewing the patch previously. Does this version look good
to you? If so, I can send it to the list.


Thanks for all of your help.

> >
> > It's also noticed that when the crash happened, nr_pages obtained by
> > readahead_count() is 512.
> > nr_pages =3D readahead_count(ractl); // this line
> >
> > 2) Normal cases that won't crash:
> > [   22.651750] Block @ 0xb3bbca6, compressed size 42172, src size 26214=
4
> > [   22.653580] Block @ 0xb3c6162, compressed size 29815, src size 26214=
4
> > [   22.656692] Block @ 0xb4a293f, compressed size 17484, src size 13107=
2
> > [   22.666099] Block @ 0xb593881, compressed size 39742, src size 26214=
4
> > [   22.668699] Block @ 0xb59d3bf, compressed size 37841, src size 26214=
4
> > [   22.695739] Block @ 0x13698673, compressed size 65907, src size 1310=
72
> > [   22.698619] Block @ 0x136a87e6, compressed size 3155, src size 13107=
2
> > [   22.703400] Block @ 0xb1babe8, compressed size 99391, src size 13107=
2
> > [   22.706288] Block @ 0x1514abc6, compressed size 4627, src size 13107=
2
> >
> > nr_pages are observed to be 32, 64, 256... These won't cause a crash.
> > Other values (max_pages, bsize, block...) looks normal
> >
> > I'm not sure why the crash happened, but I tried to modify the mask
> > for a bit. After modifying the mask value to below, the crash is gone
> > (nr_pages are <=3D256).
> > Based on my testing on a 300K pack file, there's no performance change.
> >
> > diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> > index 20ec48cf97c5..f6d9b6f88ed9 100644
> > --- a/fs/squashfs/file.c
> > +++ b/fs/squashfs/file.c
> > @@ -499,8 +499,8 @@ static void squashfs_readahead(struct
> > readahead_control *ractl)
> >   {
> >          struct inode *inode =3D ractl->mapping->host;
> >          struct squashfs_sb_info *msblk =3D inode->i_sb->s_fs_info;
> > -       size_t mask =3D (1UL << msblk->block_log) - 1;
> >          size_t shift =3D msblk->block_log - PAGE_SHIFT;
> > +       size_t mask =3D (1UL << shift) - 1;
> >
> >
> > Any pointers are appreciated. Thanks!
>

--000000000000c4a4db05deca99fc
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-WIP-squashfs-implement-readahead.patch"
Content-Disposition: attachment; 
	filename="0001-WIP-squashfs-implement-readahead.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l32mgxhk0>
X-Attachment-Id: f_l32mgxhk0

RnJvbSBkNTAyMjA2ODRiZWVkMmI2ZDM3MGQ1ZTYzYTdkZmIzMWEyYjA3ODhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+CkRh
dGU6IFN1biwgMTAgT2N0IDIwMjEgMjE6MjI6MjUgKzA4MDAKU3ViamVjdDogW1BBVENIXSBzcXVh
c2hmczogaW1wbGVtZW50IHJlYWRhaGVhZAoKSW1wbGVtZW50IHJlYWRhaGVhZCBjYWxsYmFjayBm
b3Igc3F1YXNoZnMuIEl0IHdpbGwgcmVhZCBkYXRhYmxvY2tzCndoaWNoIGNvdmVyIHBhZ2VzIGlu
IHJlYWRhaGVhZCByZXF1ZXN0LiBGb3IgYSBmZXcgY2FzZXMgaXQgd2lsbApub3QgbWFyayBwYWdl
IGFzIHVwdG9kYXRlLCBpbmNsdWRpbmc6Ci0gZmlsZSBlbmQgaXMgMC4KLSBjdXJyZW50IGJhdGNo
IG9mIHBhZ2VzIGlzbid0IGluIHRoZSBzYW1lIGRhdGFibG9jayBvciBub3QgZW5vdWdoIGluIGEK
ICBkYXRhYmxvY2suCk90aGVyd2lzZSBwYWdlcyB3aWxsIGJlIG1hcmtlZCBhcyB1cHRvZGF0ZS4g
VGhlIHVuaGFuZGxlZCBwYWdlcyB3aWxsIGJlCnVwZGF0ZWQgYnkgcmVhZHBhZ2UgbGF0ZXIuCgpT
aWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Ci0tLQogZnMv
c3F1YXNoZnMvZmlsZS5jIHwgNzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9mcy9zcXVhc2hmcy9maWxlLmMgYi9mcy9zcXVhc2hmcy9maWxlLmMK
aW5kZXggODlkNDkyOTE2ZGVhLi43Y2Q1N2UwZDg4ZGUgMTAwNjQ0Ci0tLSBhL2ZzL3NxdWFzaGZz
L2ZpbGUuYworKysgYi9mcy9zcXVhc2hmcy9maWxlLmMKQEAgLTM5LDYgKzM5LDcgQEAKICNpbmNs
dWRlICJzcXVhc2hmc19mc19zYi5oIgogI2luY2x1ZGUgInNxdWFzaGZzX2ZzX2kuaCIKICNpbmNs
dWRlICJzcXVhc2hmcy5oIgorI2luY2x1ZGUgInBhZ2VfYWN0b3IuaCIKIAogLyoKICAqIExvY2F0
ZSBjYWNoZSBzbG90IGluIHJhbmdlIFtvZmZzZXQsIGluZGV4XSBmb3Igc3BlY2lmaWVkIGlub2Rl
LiAgSWYKQEAgLTQ5NCw3ICs0OTUsNzggQEAgc3RhdGljIGludCBzcXVhc2hmc19yZWFkcGFnZShz
dHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IHBhZ2UgKnBhZ2UpCiAJcmV0dXJuIDA7CiB9CiAKK3N0
YXRpYyB2b2lkIHNxdWFzaGZzX3JlYWRhaGVhZChzdHJ1Y3QgcmVhZGFoZWFkX2NvbnRyb2wgKnJh
Y3RsKQoreworCXN0cnVjdCBpbm9kZSAqaW5vZGUgPSByYWN0bC0+bWFwcGluZy0+aG9zdDsKKwlz
dHJ1Y3Qgc3F1YXNoZnNfc2JfaW5mbyAqbXNibGsgPSBpbm9kZS0+aV9zYi0+c19mc19pbmZvOwor
CXNpemVfdCBtYXNrID0gKDFVTCA8PCBtc2Jsay0+YmxvY2tfbG9nKSAtIDE7CisJc2l6ZV90IHNo
aWZ0ID0gbXNibGstPmJsb2NrX2xvZyAtIFBBR0VfU0hJRlQ7CisJbG9mZl90IHJlcV9lbmQgPSBy
ZWFkYWhlYWRfcG9zKHJhY3RsKSArIHJlYWRhaGVhZF9sZW5ndGgocmFjdGwpOworCWxvZmZfdCBz
dGFydCA9IHJlYWRhaGVhZF9wb3MocmFjdGwpICZ+IG1hc2s7CisJc2l6ZV90IGxlbiA9IHJlYWRh
aGVhZF9sZW5ndGgocmFjdGwpICsgcmVhZGFoZWFkX3BvcyhyYWN0bCkgLSBzdGFydDsKKwlzdHJ1
Y3Qgc3F1YXNoZnNfcGFnZV9hY3RvciAqYWN0b3I7CisJdW5zaWduZWQgaW50IG5yX3BhZ2VzID0g
MDsKKwlzdHJ1Y3QgcGFnZSAqKnBhZ2VzOworCXU2NCBibG9jayA9IDA7CisJaW50IGJzaXplLCBy
ZXMsIGksIGluZGV4OworCWludCBmaWxlX2VuZCA9IGlfc2l6ZV9yZWFkKGlub2RlKSA+PiBtc2Js
ay0+YmxvY2tfbG9nOworCXVuc2lnbmVkIGludCBtYXhfcGFnZXMgPSAxVUwgPDwgc2hpZnQ7CisK
KwlyZWFkYWhlYWRfZXhwYW5kKHJhY3RsLCBzdGFydCwgKGxlbiB8IG1hc2spICsgMSk7CisKKwlp
ZiAocmVhZGFoZWFkX3BvcyhyYWN0bCkgKyByZWFkYWhlYWRfbGVuZ3RoKHJhY3RsKSA8IHJlcV9l
bmQgfHwKKwkgICAgZmlsZV9lbmQgPT0gMCkKKwkJcmV0dXJuOworCisJbnJfcGFnZXMgPSBtaW4o
cmVhZGFoZWFkX2NvdW50KHJhY3RsKSwgbWF4X3BhZ2VzKTsKKworCXBhZ2VzID0ga21hbGxvY19h
cnJheShucl9wYWdlcywgc2l6ZW9mKHZvaWQgKiksIEdGUF9LRVJORUwpOworCWlmICghcGFnZXMp
CisJCXJldHVybjsKKworCWFjdG9yID0gc3F1YXNoZnNfcGFnZV9hY3Rvcl9pbml0X3NwZWNpYWwo
cGFnZXMsIG5yX3BhZ2VzLCAwKTsKKwlpZiAoIWFjdG9yKQorCQlnb3RvIG91dDsKKworCWZvciAo
OzspIHsKKwkJbnJfcGFnZXMgPSBfX3JlYWRhaGVhZF9iYXRjaChyYWN0bCwgcGFnZXMsIG1heF9w
YWdlcyk7CisJCWlmICghbnJfcGFnZXMpCisJCQlicmVhazsKKworCQlpZiAocmVhZGFoZWFkX3Bv
cyhyYWN0bCkgPj0gaV9zaXplX3JlYWQoaW5vZGUpIHx8CisJCSAgICBucl9wYWdlcyA8IG1heF9w
YWdlcykKKwkJCWdvdG8gc2tpcF9wYWdlczsKKworCQlpbmRleCA9IHBhZ2VzWzBdLT5pbmRleCA+
PiBzaGlmdDsKKwkJYnNpemUgPSByZWFkX2Jsb2NrbGlzdChpbm9kZSwgaW5kZXgsICZibG9jayk7
CisJCXJlcyA9IHNxdWFzaGZzX3JlYWRfZGF0YShpbm9kZS0+aV9zYiwgYmxvY2ssIGJzaXplLCBO
VUxMLAorCQkJCQkgYWN0b3IpOworCisJCWlmIChyZXMgPj0gMCAmJiAocGFnZXNbbnJfcGFnZXMg
LSAxXS0+aW5kZXggPj4gc2hpZnQpID09IGluZGV4KQorCQkJZm9yIChpID0gMDsgaSA8IG5yX3Bh
Z2VzOyBpKyspCisJCQkJU2V0UGFnZVVwdG9kYXRlKHBhZ2VzW2ldKTsKKworCQlmb3IgKGkgPSAw
OyBpIDwgbnJfcGFnZXM7IGkrKykgeworCQkJdW5sb2NrX3BhZ2UocGFnZXNbaV0pOworCQkJcHV0
X3BhZ2UocGFnZXNbaV0pOworCQl9CisJfQorCisJa2ZyZWUoYWN0b3IpOworCXJldHVybjsKKwor
c2tpcF9wYWdlczoKKwlmb3IgKGkgPSAwOyBpIDwgbnJfcGFnZXM7IGkrKykgeworCQl1bmxvY2tf
cGFnZShwYWdlc1tpXSk7CisJCXB1dF9wYWdlKHBhZ2VzW2ldKTsKKwl9CisKKwlrZnJlZShhY3Rv
cik7CitvdXQ6CisJa2ZyZWUocGFnZXMpOworfQogCiBjb25zdCBzdHJ1Y3QgYWRkcmVzc19zcGFj
ZV9vcGVyYXRpb25zIHNxdWFzaGZzX2FvcHMgPSB7Ci0JLnJlYWRwYWdlID0gc3F1YXNoZnNfcmVh
ZHBhZ2UKKwkucmVhZHBhZ2UgPSBzcXVhc2hmc19yZWFkcGFnZSwKKwkucmVhZGFoZWFkID0gc3F1
YXNoZnNfcmVhZGFoZWFkCiB9OwotLSAKMi4zMS4wCgo=
--000000000000c4a4db05deca99fc
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--000000000000c4a4db05deca99fc
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel

--000000000000c4a4db05deca99fc--

